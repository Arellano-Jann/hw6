import psycopg
from psycopg import Error
from datetime import datetime

def menu():
    print("BIENVENIDOS MONKEYS. DO YOU LIKE BANANAS?")
    print("1. Log Food\n2. View Nutrients\n3. Select/Add User\n0. Exit")

class User:
    def __init__(self, user_id='0', name="default") -> None:
        self.user_id = user_id
        self.name = name

    def log_food(self, conn, cur):
        food = input("Food? (######) ")
        date = input("Date? (YYYY-MM-DD) ")
        try:
            cur.execute(f"""
                        INSERT INTO entry (user_id, fdc_id, name, date)
                        VALUES ('{self.user_id}', '{food}', '{self.name}', '{date}')""")
            conn.commit()
            print(f"Logged ({food} on {date}) for ID {self.user_id}: {self.name}")
        except Error as e:
            print(f"Error {e}")

    def view_nutrients(self, cur):
        date = input("Date? (YYYY-MM-DD) ")
        try:
            cur.execute(f"""
                        SELECT
                        entry.name, food_nutrient.fdc_id, food_update_log_entry.description, nutrient.name
                        FROM entry
                        INNER JOIN food_update_log_entry ON entry.fdc_id = food_update_log_entry.fdc_id
                        INNER JOIN food_nutrient ON entry.fdc_id = food_nutrient.fdc_id
                        INNER JOIN nutrient ON food_nutrient.nutrient_id = nutrient.nutrient_id
                        WHERE entry.date = '{date}' AND entry.user_id = {self.user_id}
                        """)
            rows = cur.fetchall()
            if rows:
                print(f"Food Log (ID {self.user_id}: {self.name} on {date})")
                for row in rows:
                    print(f"User: {row[0].strip()}, FoodId: {row[1]}, Foods: {row[2].strip()}, Nutrients: {row[3].strip()}")
            else: print("No data found")
        except Error as e:
            print(f"Error {e}")
            

def main():
    user_list = {'0' : User()} # {'id' : User}
    current_user = user_list['0']
        
    with psycopg.connect(dbname="testdb", user="postgres", host="localhost", password="postgres") as conn:
        with conn.cursor() as cur:
            while True:
                menu()
                choice = input("Select choice: ")
                if choice == '0': return
                elif choice == '1': current_user.log_food(conn, cur)
                elif choice == '2': current_user.view_nutrients(cur)
                elif choice == '3':
                    user_id = input("Input User Id: ")
                    name = input("Input Name: ")
                    current_user = user_list.get(user_id, User(user_id, name)) # create new user if DNE
                    user_list[user_id] = current_user # add to user list
                else: print("INVALID MONKEY")

if __name__ == "__main__":
    main()
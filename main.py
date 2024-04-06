import psycopg
from psycopg import Error
from datetime import datetime

def menu():
    print("BIENVENIDOS MONKEYS. DO YOU LIKE BANANAS?")
    print("1. Log Food\n2.View Nutrients\n3.Select/Add User\n0. Exit")

class User:
    def __init__(self, user_id='0') -> None:
        self.user_id = user_id

    def log_food(self, cur):
        food = input("Food? ")
        date = input("Date? ")
        try:
            cur.execute("""
                        INSERT INTO """)
            print(f"Logged ({food} on {date})")
        except Error as e:
            print(f"Error {e}")

    def view_nutrients(self, cur):
        date = input("Date? ")
        try:
            cur.execute("""
                        SELECT """)
            rows = cur.fetchall()
            if rows:
                print(f"Food Log ({self.user_id} on {date})")
                print(rows)
                for row in rows:
                    print(f"User: , FoodId: , Foods: , Nutrients: ")
            else: print("No data found")
        except Error as e:
            print(f"Error {e}")
            

def main():
    user_list = {'0' : User()} # {'id' : User}
    current_user = '0'
    db = 'dbname=postgres user=postgres'
    
    def get_user():
        user_id = input("Input User Id: ")
        current_user = user_list.get(user_id, User(user_id)) # create new user if DNE
        user_list[user_id] = current_user # add to user list
        
        
    with psycopg.connect(db) as conn:
        with conn.cursor() as cur:
            while True:
                menu()
                choice = input("Select choice: ")
                casing = {
                    '1' : User(current_user).log_food(cur),
                    '2' : User(current_user).view_nutrients(cur),
                    '3' : get_user(),
                }
                if choice == '0': return
                else: casing.get(choice, lambda x : print("Invalid. AGAIN"))()
        
        
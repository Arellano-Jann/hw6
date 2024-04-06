import psycopg
from psycopg import Error
from datetime import datetime

def menu():
    print("BIENVENIDOS MONKEYS. DO YOU LIKE BANANAS?")
    print("1. Log Food\n2.View Nutrients\n3.Select/Add User\n0. Exit")

class User:
    def __init__(self, user_id='0') -> None:
        self.user_id = user_id
        self.food = []
        self.nutrients = {}

    def log_food():
        return

    def view_nutrients():
        try:
            pass
        except Error as e:
            

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
                    '1' : User(current_user).log_food(),
                    '2' : User(current_user).view_nutrients(),
                    '3' : get_user(),
                }
                if choice == '0': return
                else: casing.get(choice, lambda x : print("Invalid. AGAIN"))()
        
        
import sqlite3
from sqlite3 import Error


def create_connection(db_insert):
    """ create a database connection to a SQLite database """
    conn = None
    try:
        conn = sqlite3.connect(db_insert)
        print(sqlite3.version)
    except Error as e:
        print(e)
    finally:
        if conn:
            #--When a book is selected, information on the author(s), genre(s), publisher,
            #number of pages, price, etc. can be viewed.
            cur = conn.cursor()

            #WHAT WOULD YOU LIKE TO DO 
            print("What would you like to do? ")
            print("1. Search for a book ")
            ans = input("Please enter a selection : ")
            if ans=="1":
                print("1. Search for a book by an Author ")
                print("2. Search for a book by an ISBN ")
                print("3. Search for a book by the Genre ")
                print("4. Search for a book by the book name ")    
    
                searchinput = input("Please enter a selection : ") 
                
                if searchinput=="1" :
                                val =input("Enter the Author name : ")
                                cur.execute("SELECT DISTINCT bookName, author, number_of_pages ,ISBN FROM book WHERE bookName =?",(val,)) #selecting the values from book table
                                rows = cur.fetchall() #getting all values from table
                                print(rows)
                                conn.close()

                elif searchinput=="2":
                                val =input("Enter the Genre : ")
                                cur.execute("SELECT DISTINCT bookName, author, ISBN FROM book WHERE author =?",(val,))
                                rows = cur.fetchall()
                                print(rows)   
                                conn.close()
                elif searchinput=="3":
                                val =input("Enter the ISBN number : ")
                                cur.execute("SELECT DISTINCT bookName, author, number_of_pages ,ISBN FROM book WHERE ISBN =?",(val,))
                                rows = cur.fetchall()
                                print(rows)   
                                conn.close()     
                elif searchinput=="4":
                                val =input("Enter the Book Name : ")
                                cur.execute("SELECT DISTINCT bookName, author, number_of_pages ,ISBN FROM book WHERE bookName =?",(val,))
                                rows = cur.fetchall()
                                print(rows)   
                                conn.close()                                             

        print("Would you like to place an order?")


           # print("RETURNING THE BOOK WITH [ BOOKNAME, AUTHOR, NUMBER OF PAGES, AND THE ISBN ]")
            #cur.execute("SELECT DISTINCT bookName, author, number_of_pages ,ISBN FROM book WHERE bookName =?",(val,))
        
            #rows = cur.fetchall()
            #print(rows)
    



if __name__ == '__main__':
    create_connection(r"C:\Users\Saaji\Desktop\3005project\lookinabook.db")
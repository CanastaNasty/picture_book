# Picture Book

The premise of Picture Book is to create a versatile system for creating and sharing virtual books with pictures and sounds. The goal of this project is to provide young children with a variety of educational and amusing experiences. The first stage has been to make book viewing easy enough for a baby. The second stage will be making book creation easy enough for a child.

Basic Architecture:
Users (with custom built login, admin setup, and session management)
	Have many Books (with titles)
		Have many pages (with pictures and sounds)

Signed in users can create and edit books, and add and remove pages in the same basic form.

The list of a user's books can be viewed from their profile page.

To Do:
* Develop javascript frontend
* Get working on Heroku
* Create index for all books
* Allow books to be public or private
* Standardize page size
* Allow image and sound uploading
* Add gesture recognition for easy browsing by babies
* Add page reordering to book creation and editing

This is an application for
*Making your own picture books*
by [David Moore](https://github.com/CanastaNasty).
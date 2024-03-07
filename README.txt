1) Open up MySQL Workbench (install MySQL and MySQL Workbench if not already installed on your system)
2) You want to connect to and start the MySQL Server
	- Be sure to make the host: localhost
	- Be sure to have the port: 3306
    **If you dont have the MySQL Server set up, please do so with the following requirements above**
3) Once connected to the MySQL Server, underneath the "Edit" button on the top left corner of the Workbench, 
   there will be an icon to <Open a SQL script file in a new query tab> **Click this**
4) Then choose the file <Farhat_Hassan_&_Bavisetty_Avinash_queries.sql> file
5) Once the script is opened in the Workbench, near the top center, above the first line of the script, of 
   the area where we are allowed to make changes to the script, the third icon from the left side of icons
   should be a **Lightning Bolt** <Execute the selected portion of the script or everything, if there is no selection>
   **Click this** to run the entire script and create and populate the Database
6) You may refresh the Schema bar on the left side to see the DB addition, if you so choose to.
7) Now, while in that left side bar, at the bottom of the bar there is an <Administration> tab **Click this**
8) Once clicked, under the <Management> section, there should be <Users and Privilages> **Click this**
9) Once in <Users and Privilages> you must add an admin account for out UI and API calls to work with the DB
	- Directly beside the Schema left side bar, at the bottom on the right side of the bar, there should an
	  <Add Account> button **Click this**
	- Then, when adding Details for the admin account use the following:
		- Under Login Tab
			- Login Name: admin
			- Authentication Type: Standard
			- Limit to Hosts Matching: localhost
			- Password: admin
			- Confirm Password: admin
			- **Click Apply near bottom right corner**
		- Under Account Limits
			- Max. Queries: 10000
			- Max. Updates: 10000
			- Max. Connections: 10000
			- Concurrent Connections: 10000
			- **Click Apply near bottom right corner**
		- Under Administrative Roles
			- Checkmark the DBA role
			- **Click Apply near bottom right corner**
10) Now that the admin user is created, **Keep the MySQL Server Running as is** 
11) You can now head to our websites repository and open it/clone it using VS Code.
	- The link to clone is: https://github.com/HassanBFarhat/DB_UI_445.git
    ** If you don't have VS Code installed, you should install it as it was the primary IDE used for our UI project**
12) Once cloned in VS code, and the repository is opened, you will need to download one extension to make your life
    using the website a whole lot easier. You need to install **Live Server by Ritwick Dey** extension
	- the Extension ID is: ritwickdey.LiveServer
    ** If you do not know how to install an extension in VS Code, a simple google search or Youtube video will guide you**
13) Next, you're going to need to open up the terminal for the project folder, you can do so by looking at the top
    left corner of VS code, there should be a tab/button called <Terminal> **Click this**
14) When the terminal pops up, within the terminal, write the command <nodemon server.js> then **Click Enter on Keyboard**
15) Now that the server.js file is running, it is now connected to the database from MySQL Server
16) Finally, the last thing you need to do is open up the main webpage to access the website and its functionality, 
    to do so within the main project folder housing all the files/folders:
	- Open the <Webpages folder>
	- With mouse, right click on <index.html>
	- Then **click** on <Open with Live Server>
17) You should now be able to access the website and mess around with what we have implemented thus far.
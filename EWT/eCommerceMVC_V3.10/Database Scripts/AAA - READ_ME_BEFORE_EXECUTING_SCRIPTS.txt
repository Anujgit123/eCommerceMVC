eCommerceMVC is configured to create database automatically with the help of Entity Framework. 
You don't need to create database through script. All you need to do is create an empty database
on any server and update the connection string in web.config file in eCommerce.Web module. EF will
take care of database creation and seeding initial data.

If you still want to create database yourself, create an empty database and execute
the 'Full_Database_Schema_Data_Script_V3.10' script. Then update the connection string
in web.config file in eCommerce.Web module.

-------------------------------------------------------------------------------------------------

To insert Demo Products and Categories, follow the below steps.

1- Run the demo-data-script.sql on your database. It will add products and categories on database.
2- Product images will be missing from step 1, so just copy all the images from images folder and
copy to the following location in project.
	eCommerce.Web > Content > images > demo

in case there are already images in demo folder, ignore step 2. 

Reload your site and you will find the products displayed on your site.

-------------------------------------------------------------------------------------------------

Sajjad Gul - 15July22
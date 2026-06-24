These scripts are for deleting an email from inbox's. The two scripts have similar function but for different purposes. Please note, you can only remove an email from inboxes that are on your exchange server. You can NOT remove an email from a contractor or vendor per say.

## Safety
In order to make sure you don't accidentantly mass delete something. There is multiple basic checks, such as making sure the sender is an email address, and not blank. There also is a confirm before deleting, the response to this MUST be `Y` exactly. Please keep in mind I am not responsible for what you may delete, please use at your own risk. Once deleted it will disappear from inbox and deleted items, thus why the confirm was added. 
## DeleteEmail.bat
This is for deleting an email from every single user. It takes in the Sender and the Subject to verify you are deleting the correct email. It may take a few minutes depending on amount of accounts. This is meant to be run on the exchange server itself with an account with full permissions. 

<img width="449" height="140" alt="image" src="https://github.com/user-attachments/assets/29371406-28bb-4545-b8e7-27b850b6b365" />

## DeleteEmail - Individual.bat
Similar name, similar function EXCEPT we are only deleting an email for a SINGLE users inbox. If you accidentantly sent something to the wrong person and want it gone from their inbox before they see it, this is the correct script for you. You need to provide, SUBJECT, TO, FROM exactly in order for it to delete. 

<img width="392" height="175" alt="image" src="https://github.com/user-attachments/assets/7bc4688a-0e7e-4b36-bdd8-1986989c83a2" />

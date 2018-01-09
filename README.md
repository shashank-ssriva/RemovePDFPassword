# RemovePDFPassword
A Bash shell script to decrypt all the encrypted PDF documents in the provided directory so that you don't have to enter password again &amp; again to open them. Works on Mac, Ubuntu & RedHat based systems.

## Introduction.

Most of the bank & investment statements are password protected so you have to enter a password every time you need to open the document. While it is great for security purpose, entering password becomes really irritating when you have to do it again & again & again. Worst part is, you may even forget the password & hence you simply can't access those documents without investing some time.
RemovePDFPassword decrypts your secured PDF documents & copies them to a different directory where you can easily access them without entering the password. It works on a given directory, so it can very quickly decrypt the entire directory before you even get the chance to blink your eyes! It works well when you have placed all those statements related to a particular bank or investment company inside a particular folder. For example, you can keep all your Axis bank statements in a folder & RemovePDFPassword will quickly decrypt all the files inside it & copy them to a different location. Your original documemts remain untouched.

## Best Practices.

Keep your related/similar documents in specific folders. For example, all those documents that have the same passwords must be kept inside one folder. It makes sense to use a well-oranised folder structure.

## How To Use?

Clone or download the repository & make the shell script executable.

```bash
chmod +x RemovePDFPassword.sh
```
After this, change the line #77 & replace the password for your documents there.

``--password=DOCUMENT_PASSWORD``

Then, execute the script. Its that easy!! This script takes care of installing the required QPDF library on the basis of your OS (*which it detects automatically*) & also validates the empty directory, non-existent directory or the directories that don't have any PDF files inside.

## Script In Action.

```bash
root@development-server /h/s/Shell Scripts# ./removePasswordPDF.sh 
Detecting OS of your machine...

Your OS is : - Ubuntu.

Checking QPDF insallation...

This script requires a package called QPDF in order to decrypt your PDF files 8-) Do you want to install it? Its a one time process only. Press y to install or n to cancel.
n
You chose not to install QPDF :-( I will exit now!!!
```
```bash
root@development-server /h/s/Shell Scripts# ./removePasswordPDF.sh 
Detecting OS of your machine...

Your OS is : - Ubuntu.

Checking QPDF insallation...

This script requires a package called QPDF in order to decrypt your PDF files 8-) Do you want to install it? Its a one time process only. Press y to install or n to cancel.
n
You chose not to install QPDF :-( I will exit now!!!

root@development-server /h/s/Shell Scripts# ./removePasswordPDF.sh 
Detecting OS of your machine...

Your OS is : - Ubuntu.

Checking QPDF insallation...

This script requires a package called QPDF in order to decrypt your PDF files 8-) Do you want to install it? Its a one time process only. Press y to install or n to cancel.
y
You chose to install QPDF. Installing it for your Ubuntu now :-)
Reading package lists... Done
Building dependency tree       
Reading state information... Done
The following additional packages will be installed:
  libqpdf17
The following NEW packages will be installed:
  libqpdf17 qpdf
0 upgraded, 2 newly installed, 0 to remove and 2 not upgraded.
Need to get 509 kB of archives.
After this operation, 1,400 kB of additional disk space will be used.
Get:1 http://us.archive.ubuntu.com/ubuntu zesty/main amd64 libqpdf17 amd64 6.0.0-2 [300 kB]
Get:2 http://us.archive.ubuntu.com/ubuntu zesty/main amd64 qpdf amd64 6.0.0-2 [210 kB]
Fetched 509 kB in 3s (161 kB/s)
Selecting previously unselected package libqpdf17:amd64.
(Reading database ... 201002 files and directories currently installed.)
Preparing to unpack .../libqpdf17_6.0.0-2_amd64.deb ...
Unpacking libqpdf17:amd64 (6.0.0-2) ...
Selecting previously unselected package qpdf.
Preparing to unpack .../qpdf_6.0.0-2_amd64.deb ...
Unpacking qpdf (6.0.0-2) ...
Setting up libqpdf17:amd64 (6.0.0-2) ...
Processing triggers for libc-bin (2.24-9ubuntu2.2) ...
Processing triggers for man-db (2.7.6.1-2) ...
Setting up qpdf (6.0.0-2) ...
This script will decrypt all the encrypted PDF documents in the provided directory, given they all have the same password.
Enter the full path where your encrypted PDF documents are stored.../home/shashank/encrypted_PDF
You provided /home/shashank/encrypted_PDF as the path. Performing magic there! ;-) But before that, lets see if this directory contains any PDF files or not.
ls: cannot access '/home/shashank/encrypted_PDF': No such file or directory
./removePasswordPDF.sh: line 53: cd: /home/shashank/encrypted_PDF: No such file or directory
Looks like /home/shashank/encrypted_PDF is empty & does not contain any file at all. Exiting now...
```
On Mac : - 

```bash
admin@shashank-mbp ~/D/Shell Scripts> ./removePasswordPDF.sh
Detecting OS of your machine...

Your OS is : - Mac OS X.

Checking QPDF insallation...

/usr/local/bin/qpdf
QPDF already installed! Lets get started :-)
This script will decrypt all the encrypted PDF documents in the provided directory, given they all have the same password.
Enter the full path where your encrypted PDF documents are stored.../Users/admin/Desktop/test
You provided /Users/admin/Desktop/test as the path. Performing magic there! ;-) But before that, lets see if this directory contains any PDF files or not.
Looks like /Users/admin/Desktop/test is empty & does not contain any file at all. Exiting now...
```
```bash
admin@shashank-mbp ~/D/Shell Scripts> ./removePasswordPDF.sh
Detecting OS of your machine...

Your OS is : - Mac OS X.

Checking QPDF insallation...

/usr/local/bin/qpdf
QPDF already installed! Lets get started :-)
This script will decrypt all the encrypted PDF documents in the provided directory, given they all have the same password.
Enter the full path where your encrypted PDF documents are stored.../Users/admin/Desktop/wls_test
You provided /Users/admin/Desktop/wls_test as the path. Performing magic there! ;-) But before that, lets see if this directory contains any PDF files or not.
There appears to be ZERO PDF files in /Users/admin/Desktop/wls_test. There is nothing to decrypt! Exiting now...
```
```bash
admin@shashank-mbp ~/D/Shell Scripts> ./removePasswordPDF.sh
Detecting OS of your machine...

Your OS is : - Mac OS X.

Checking QPDF insallation...

/usr/local/bin/qpdf
QPDF already installed! Lets get started :-)
This script will decrypt all the encrypted PDF documents in the provided directory, given they all have the same password.
Enter the full path where your encrypted PDF documents are stored.../Users/admin/Desktop/Secured_PDF/
You provided /Users/admin/Desktop/Secured_PDF/ as the path. Performing magic there! ;-) But before that, lets see if this directory contains any PDF files or not.
Number of pdf files: 5
Your original files won't be touched. New decrypted files will be created in directory : - /Users/admin/Decrypted_PDF_Documents.
Directory /Users/admin/Decrypted_PDF_Documents already exists, hence not creating it!
Success!! You can now navigate to /Users/admin/Decrypted_PDF_Documents directory to access your PDF documents without having to enter passwords :-)
```

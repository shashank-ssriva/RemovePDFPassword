#! /bin/bash
#Author : - Shashank Srivastava
#Date : - 8th of Januray, 2017
#set -x

#This script will try to detect the OS & then install QPDF pcakage on its basis.
echo "Detecting OS of your machine..."
echo ""
OS=`uname -v | awk '{print$1}' | sed 's:.*-::'`
if [ "$OS" == "Darwin" ]
then
  echo "Your OS is : - Mac OS X."
elif [ "$OS" == "Ubuntu" ]
then
  echo "Your OS is : - Ubuntu."
else
  echo "Your OS is : - RHEL."
fi
echo ""
echo "Checking QPDF insallation..."
echo ""
which qpdf
if [ $? -ne 0 ]
then
  echo "This script requires a package called QPDF in order to decrypt your PDF files 8-) Do you want to install it? Its a one time process only. Press y to install or n to cancel."
  read ANSWER
  if [ $ANSWER == "y" ] && [ $OS == "Darwin" ]
  then
    echo "You chose to install QPDF. Installing it for your $OS now :-)"
    brew install qpdf
  elif [ $ANSWER == "y" ] && [ $OS == "Ubuntu" ]
  then
    echo "You chose to install QPDF. Installing it for your $OS now :-)"
    sudo apt-get install qpdf -y
  elif [ $ANSWER == "y" ] && [ $OS == "RHEL" ]
  then
    echo "You chose to install QPDF. Installing it for your $OS now :-)"
    yum install qpdf -y
  elif [ $ANSWER == "n" ]
  then
    echo "You chose not to install QPDF :-( I will exit now!!!"
    exit
  fi
else
  echo "QPDF already installed! Lets get started :-)"
fi

echo "This script will decrypt all the encrypted PDF documents in the provided directory, given they all have the same password."
echo -n "Enter the full path where your encrypted PDF documents are stored..."
read ANSWER
echo "You provided $ANSWER as the path. Performing magic there! ;-) But before that, lets see if this directory contains any PDF files or not."
if [ ! -d "$ANSWER" ];
then
  echo "Oops!! $ANSWER does not seem to be a correct directory. Please ensure the correctness of your directory & run the script again! Exiting now..."
  exit
fi

isDIREmpty=`ls -lh "$ANSWER" | wc -l`
if [[ $isDIREmpty -eq 0 ]]; then
  echo "Looks like $ANSWER is empty & does not contain any file at all. Exiting now..."
  exit
fi

numPDFfiles=`cd "$ANSWER"; shopt -s nullglob; for ext in pdf; do files=( *."$ext" ); printf 'Number of %s files: %d\n' "$ext" "${#files[@]}"; done | awk '{print $5}'`
if [ -d "$ANSWER" ] && [ $numPDFfiles -eq 0 ]; then
  echo "There appears to be ZERO PDF files in $ANSWER. There is nothing to decrypt! Exiting now..."
  exit
fi

cd $ANSWER
shopt -s nullglob;
for ext in pdf; do files=( *."$ext" ); printf 'Number of %s files: %d\n' "$ext" "${#files[@]}"; done
echo "Your original files won't be touched. New decrypted files will be created in directory : - ${HOME}/Decrypted_PDF_Documents."
if [ -d ${HOME}/Decrypted_PDF_Documents ]
then
  echo "Directory ${HOME}/Decrypted_PDF_Documents already exists, hence not creating it!"
else
  mkdir ${HOME}/Decrypted_PDF_Documents
fi
echo -n "Enter the password here. Its only needed once..."
read PASSWD
for f in *; do [[ -d "$f" ]] || qpdf --password=$PASSWD --decrypt "$f" "${HOME}/Decrypted_PDF_Documents/$f-UNSECURED.pdf"; done
echo "Success!! You can now navigate to ${HOME}/Decrypted_PDF_Documents directory to access your PDF documents without having to enter passwords :-)"

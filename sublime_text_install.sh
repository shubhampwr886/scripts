    sudo apt update
    sudo apt install apt-transport-https ca-certificates curl software-properties-common

    #Import the repository’s GPG key using the following curl command :

    curl -fsSL https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -

    #Add the Sublime Text APT repository to your system’s software repository list by typing:

    sudo add-apt-repository "deb https://download.sublimetext.com/ apt/stable/"

    #Once the repository is enabled, update apt sources and install Sublime Text 3 with the following commands:

    sudo apt update
    sudo apt install sublime-text





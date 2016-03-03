# Docker image for legacy Informatics expenses claimform program

The docker image is pushed to
<https://hub.docker.com/r/davidaspinall/claimform/>

This README is in <https://github.com/DavidAspinall/claimform>.

## Usage

Build with

~~~~
    docker build -t claimform docker-claimform
~~~~

To run, you can use the docker volume mounted at `/claims` to share a directory containing
claim forms, like this:
~~~~
    docker run --rm=true -v `pwd`:/claims claimform claimform -o 2014-11-Books.pdf 2014-11-Books.claim
~~~~
The directory should have a `claimformrc` file in it.

To see a sample claimform do:
~~~~
    docker run --rm=true claimform cat /claims/example.claim
~~~~

and a sample rc:
~~~~
    docker run --rm=true claimform cat /claims/claimformrc
~~~~

To see claimform command usage instructions:
~~~~
    docker run --rm=true claimform man claimform
~~~~


## Resources

RPMs fetched with:

~~~~
   cp /afs/inf.ed.ac.uk/pkgs/rpms/os/sl6/x86_64/world/claimform-2.5.9-1.noarch.rpm .
   wget ftp://ftp.icm.edu.pl/vol/rzm5/linux-fedora/linux/releases/21/Everything/x86_64/os/Packages/t/t1utils-1.37-7.fc21.x86_64.rpm
~~~~

# StenoSpam

```
     _                                             
 ___| |_ ___ _ __   ___  ___ _ __   __ _ _ __ ___  
/ __| __/ _ \ '_ \ / _ \/ __| '_ \ / _` | '_ ` _ \ 
\__ \ ||  __/ | | | (_) \__ \ |_) | (_| | | | | | |
|___/\__\___|_| |_|\___/|___/ .__/ \__,_|_| |_| |_|
                            |_|      
```

Simple tool for automating basic checks when doing stenography CTF challenges.

## Installation

To install the various tools used you can git clone the project and run the setup.sh script.
```bash
git clone https://github.com/a9sk/stenospam
cd stenospam
sudo bash setup.sh
```
To create a symlink to the code and be able to run the script from any point in your file system run the symlink.sh script.
```bash
sudo bash symlink.sh
```
NOTE: after creating the symlink do not remove the directory or the symlink will not work.

To run the script you can then use the command stenorun from your terminal
```bash
stenorun <filename> -fF <flag format>
```

## Usage

```bash
Usage: stenorun <filename> -fF <flag format>

    Flag Format
        -fF <flag format> to set the flag format (i.e. if -fF is set to 'abc' the flag format will be abc{flag_goes_here})

    Miscellaneous
        -h  show this message and exits
```

## Tools Used

The prebuilt tools used are:
- [Strings](https://ioflood.com/blog/strings-linux-command/) for strings enumeration;
- [Exiftool](https://exiftool.org/) to read metadatas from images, audio, videos and PDFs;
- [Exiv2](https://exiv2.org/) to read images metadata;
- [Binwalk](https://github.com/ReFirmLabs/binwalk) for searching a given binary image for embedded files and executable code;
- [Zsteg](https://github.com/zed-0xff/zsteg) to detect data in PNG and BMP files.

## Licence

See the [LICENSE](LICENSE.md) file for license rights and limitations (MIT).

## Contacts

To report bugs, request new features, or ask questions, contact the project author:

- Email: 920a9sk765@proton.me
- GitHub: [@a9sk](https://github.com/a9sk)

# StenoSpam

Simple tool for automating basic checks when doing stenography CTF challenges.

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
- [Zsteg](https://github.com/zed-0xff/zsteg) to detect data in PNG and BMP files;
- [Wavsteg](https://github.com/pavanchhatpar/wav-steg-py) to extract hidden data from .wav files

## Licence

See the [LICENSE](LICENSE.md) file for license rights and limitations (MIT).

## Contacts

To report bugs, request new features, or ask questions, contact the project author:

- Email: 920a9sk765@proton.me
- GitHub: [@a9sk](https://github.com/a9sk)

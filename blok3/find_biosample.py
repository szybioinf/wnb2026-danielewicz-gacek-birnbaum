#!/usr/bin/env python3
import sys
from Bio import Entrez


Entrez.email = "130938@student.upwr.edu.pl"

if len(sys.argv) == 1:
    handle = Entrez.esearch(
        db="assembly",
        term='"Lupinus angustifolius"[Organism]',
        retmax=100
    )
    record = Entrez.read(handle)
    handle.close()
    print(record["IdList"])
else:
    assembly_id = sys.argv[1]
    handle = Entrez.elink(
        dbfrom="assembly",
        db="biosample",
        id=assembly_id,
        linkname="assembly_biosample",
    )
    links = Entrez.read(handle)
    handle.close()
    biosample_id = links[0]["LinkSetDb"][0]["Link"][0]["Id"]
    with open("bio_ids.txt", "w") as f:
        f.write(biosample_id + "\n")
    print("BioSample:", biosample_id)
    print("Zapisano: bio_ids.txt")

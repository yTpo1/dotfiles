Tool: gpg  
> gpg --list-keys

## Generate keys
> gpg --gen-key

## Export Public Key
> gpg --output public.pgp --export username@email
This command will export an ascii armored version of the public key:
> gpg --output public.pgp --armor --export username@email

## Export Secret Key
> gpg --output private.pgp --export-secret-key username@email
> gpg --export-secret-key name > ~/my-key.asc
This command will export an ascii armored version of the secret key:
> gpg --output private.pgp --armor --export-secret-key username@email

## Import key
gpg --import my-key.asc

## Delete keys
> gpg --delete-keys 
> gpg --delete-secret-keys

## GPG Change Passphrase Secret Key
`
gpg --edit-key Your-Key-ID-Here
gpg> passwd
gpg> save
`

## If Error: "There is no assurance this key belongs to the named user"
`
gpg --edit-key <KEY_ID>
gpg> trust
`
then choose
> 5 = I trust ultimately
> Do you really want to set this key to ultimate trust? (y/N) y

## Encrypt file with a password
> gpg -c somefile.txt  

option -c (encryption only with symmetric cipher). CAST5 encryption algorithm automatically.  

## Decrypt file with a password
> gpg important.txt.gpg


#### Other tools
https://www.tecmint.com/linux-password-protect-files-with-encryption/


---

### Contents Covered

- Public Key Infrastructure ( #PKI )
- Encryption, Hashing, Digital Signatures
- Installing and configuring PKI solutions
- Secure Sockets Layer ( #SSL )
- Transport Layer Security ( #TLS )


---

### Prerequisite Knowledge
- TCP/IP - how it works and what is it.
- Web server/browser configuration -  have a general sense of how you might go about configuring a web browser/server

---

SSL - Secure Socket Layer
TLS - Transport Layer Security

### Public Key Infrastructure

#### Understanding Cryptography

SSL/TLS are security protocols that are used to secure network communications

**Cryptography** is a method of securing data such that it is trusted and is viewable only by authorized parties

For this to work, cryptographic keys need to be stored somewhere in order to partake in securing things like network communications

Cryptographic Key Storage ways
-> PKI certificate
-> Smart Card/Common Access Card(CAC)
-> File
-> Trusted Platform Module(TPM)
-> Token Device

#### General Encryption Process
1. Plaintext is fed into an encryption algorithm
2. A key is also used with the encryption algorithm
3. The encryption algorithm results in encrypted data (ciphertext)
4. Only those parties with a decryption key can decrypt the ciphertext


#### Symmetric Cryptography

1. Uses a single secret key
2. The secret key encrypts and decrypts the data 
3. All parties that either trying to encrypt or decrypt needs this key
4. This key must be kept secure

Symmetric Encryption Algorithms

| Algorithm | Max. Key size(bits) |
| --------- | ------------------- |
| AES       | 256                 |
| RC4       | 2048                |
| 3DES      | 168                 |
| Blowfish          | 448                    |

#### Asymmetric Cryptography

1. Uses two mathematically related keys
2. Public key and private key are used in implementation of these type of algorithms

Asymmetric Encryption Algorithms

| Algorithm      | Max. Key size (Bits) | Description                                                    |
| -------------- | -------------------- | -------------------------------------------------------------- |
| RSA            | 4096                 | -                                                              |
| Diffie-Hellman | n/a                  | This is more of a key exchange mechanism implemented algorithm |
| ElGamal        | 2048                 | -                                                              |
| ECC               | 256                     | -                                                                |


Asymmetric Email Encryption Process
1. Sender encrypts the plaintext with receivers public key 
2. Receiver decrypts the encrypted text received using his private key.

---

SSL/TLS Network Security process 

1. Client sends the list of supported ciphers to web server
2. Server sends cipher that will be used along with the PKI certificate, which includes the servers public key and the servers hostname
3. Client generates and sends a unique session key(symmetric key)

Now to secure that symmetric key which is session key, it is encrypted with web servers public key. The web server then decrypts it with its private key

---

### PKI hierarchy

PKI is a collection or hierarchy of digital security certificates.

These certificates always contain public keys of the registered entities
These certificates can also contain private keys which is are defined by the entities in some specific cases for authentication or authorization

One of such components of PKI hierarchy is

-> Certificate Authority (CA)
	This component is used to issue new certificates to entities
	It can also renew, revoke certificates
	This CA also maintains the Certification Revocation List(CRL) which is essentially a list of serial number of revoked certificates

-> Registration Authority (RA)
	Also called subordinate CA. Also used to manage certificates

-> Certificate Revocation List (CRL) or Online Certificate Status Protocol (OCSP)
	verification of certificate validity using a serial number

-> Certificate Template
	Blueprint used when issuing certificates
	This can be customized depending on your needs and how the resultant issued PKI certificates are to be used

-> Certificate
	contains subject name, signature of CA, expiry information, public/private key

Revoked certificates cannot partake in part of secure communications

In case of multi-tier PKI hierarchy, from a security perspective, it makes sense to keep the certificate authority at the top of the hierarchy offline until its needed, since we have registration authority doing the work on behalf of the top certificate authority


---

### Certificate Authorities

Certificate/registration authorities have a longer validity period than the issued certificates

Can also publish certification revocation list over a variety of protocols including things like HTTP  and this certificate revocation list can then be retrieved by clients before they partake in communication that would PKI certificates

__Chain of Trust__
	The digital signatures of the certificate authority will exist in all of the certificates that it issues
	-> We trust CA that implies we trust all the certificates that it issue

SSL/TLS are directly related to PKI certificates

PKI certificates are also called _X.509 certificates_ as it follows X.509 standard

---

#### What type of data is stored in PKI certificates?

1. Version number
	1. defines the X.509 or PKI version number
2. Serial number
	1. used to track certificates such as through certification revocation list, 
3. CA digital signature and Algorithm used
4. validity period
5. Certificate usage details
6. Subject name such as URL or email address or domain name etc..
7. Public or Private keys

We can use wildcard certificates for multiple DNS second level domain names via the subject
This means that the certificate is issued to top-level DNS domain and all the subdomains are automatically trusted using single PKI certificate

OCSP Stapling
	certificate owner checks the CA for its status periodically, such as a web server with an SSL/TLS certificate
	Clients connecting to the secured website receive OCSP status for that website
	In this case, clients do not have to query the OCSP responder for website certificate status separately

PKP - Public Key Pinning
	This is information that is sent between the client web browser and web server so that trusting devices can download a trusted copy of a server certificate which includes public key
	In this we store a copy of that server certificate public key locally on the client device
	Upon future connections to the server, clients require that the server provide a fingerprint that has been previously pinned
	By this we are mitigating certificates issued to known hosts from unauthorized CAs such as \<mail.google.com> being issued a certificate from an attackers self-signed CA
	These also have a certified lifetime 

---

#### Certificate Lifecycle

It starts with certificate request, this can be manual or it can be automated
If everything is okay, then the certificate is issued, then it can be used according to its purpose
If the certificate is expired then new certificate must be created and digitally signed and to be send to receiver

1. Certificate request
	1. depending on the algorithm being used and software is used, public and private key of the entity is created and then public keys are made available to trusted third parties
	2. Certificate Signing Request(CSR) is generated next, which includes a unique public key commonly in PKCS #10 format
	3. This CSR is sent to certificate authority for signing
2. Certificate issuance
	1. require admin approval before certificate is issued
	2. certificate is stored in the device trusted certificate store or other media such as a smart card
3. Certificate usage
	1. apps can first verify the validity of a certificate before using them (via CRL or OCSP)
4. Certificate revocation
5. Certificate renewal
6. Certificate expiry


---

### SSL vs TSL

Both uses PKI certificates and related keys to secure network communication

Both in conjunction with PKI certificates, allow for data encryption and confidentiality
Also allows for digital signatures and hashing for authentication, integrity and non-repudiation

Both protocols are application specific, it must be configured separately for HTTP and SMTP and similar protocols 


Security protocol downgrade attacks are common and are problems with the current standard of SSL protocols and hence it is recommended to use TLS instead of SSL unless its necessary

For security reasons, disable SSL and use TLS >v1.1


---

### Hashing and Digital Signatures

Hashing doesn't provide data confidentiality

Used to verify the integrity of network messages, files and machine boot-up settings

Used in both SSL and TLS
Uses a one-way algorithm that results in a unique value from which we cant generate input value except using the brute-force method

Digital Signatures provides data authentication, integrity and non-repudiation
This is done by using the private key of the user, so if a message is sent by a user that user sings the message using his private key so that once we decrypt it with the users public key we can actually verify the user authentication for the message sent.

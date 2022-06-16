---
banner: "![[githubbanner.jpg]]"
banner_y: 0.51606
---
# What are SSH Keys?!

[Pro tip: use SSH keys for each one of your machines... and use this guide to get started 🔑😄. So, in this tutorial, you’ll learn what they are, some of their advantages, and how to generate and configure GitHub SSH keys.](https://twitter.com/intent/tweet?url=https%3A%2F%2Fkinsta.com%2Fblog%2Fgenerate-ssh-key%2F&via=kinsta&text=Pro+tip%3A+use+SSH+keys+for+each+one+of+your+machines...+and+use+this+guide+to+get+started+%F0%9F%94%91%F0%9F%98%84.+So%2C+in+this+tutorial%2C+you%E2%80%99ll+learn+what+they+are%2C+some+of+their+advantages%2C+and+how+to+generate+and+configure+GitHub+SSH+keys.&hashtags=SSH%2CWebDev)

## Public vs Private Keys

Let’s start with the basics.

The SSH protocol uses a technique of cryptography called **asymmetric encryption**. This term may sound complicated and weird, but nothing could be further from the truth.

Basically, asymmetric encryption is a system that uses a pair of keys, namely **public** and **private** keys.

As you may guess, the public key can be shared with anyone. Its main purpose is to encrypt data, converting the message into secret code or ciphertext. This key is usually sent to other systems — for example, servers — to encrypt the data before sending it over the internet.

On the other hand, the private key is the one that you must keep to yourself. It’s used to decrypt the encrypted data with your public key. Without it, it’s impossible to decode your encrypted information.

This method allows you and the server to keep a safe communication channel for transmitting the information.

Here’s what happens in the background when you connect to a server via SSH:

1. The client sends the public key to the server.
2.  The server asks the client to sign a random message encrypted with the public key using the private key.
3.  The client signs the message and forwards the result to the server.
4.  A secure connection is established between the client and the server.

It’s important to keep your private keys safe and share them with anyone under no circumstances. They’re literally the key to all the information sent to you.  


# Lets's start by generating them localy from the CMD or TERMINAL:

- Run this command that will generate your public key:

```
ssh-keygen -t ed25519 -C "exmplename@exampledomain.com"
```

[ssh-keygen](https://linux.die.net/man/1/ssh-keygen): The command-line tool used for creating a new pair of SSH keys. You can see its flags with `ssh-keygen help`
**-t ed25519:** The `-t` flag is used to indicate the algorithm used to create the digital signature of the key pair. If your system supports it, `ed25519` is the best algorithm you can use to create SSH key pairs.
**-C “email”:** The `-c` flag is used to provide a custom comment at the end of the public key, which usually is the email or identification of the creator of the key pair.

*This is how it looks: ⤵️*

![[ssh-keygen-1024x540.png]]

- Check if this Wallet of keys process is runing or not:

```
eval `ssh-agent`
```

- Add your SSH private key (the one without extension) to the ssh-agent.

```
ssh-add ~/.ssh/ed25519
```

- Copy your SSH public key to your clipboard. You can open the file where it is located with a text editor and copy it, or use the terminal to show its contents.

```
cat ~/.ssh/kinsta_keys.pub
```

- Go and login to your github account and go to settings and ``` Add new SSH``` tittled with the name of the machine and contented with ```.ssh/ed25519.pub``` content.

- Test it with a push to a remote directory after you cloned it with ``` ssh.git ``` and played with it in your local system.

- Done 😁





#terminal #docs #webdevelopment #frontenddevelopment #cmd
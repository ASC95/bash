# Links
- https://docs.gitlab.com/ee/ssh/
- https://security.stackexchange.com/questions/40050/best-practice-separate-ssh-key-per-host-and-user-vs-one-ssh-key-for-all-hos - how many keys?
- https://www.digitalocean.com/community/questions/is-the-password-on-my-ssh-keys-really-secure - does password on private key protect it?
# How many keys?
- I could use the same public and private key pair everywhere, but then as soon as my private key was compromised it could be used to login
  everywhere
  - Practically speaking, if my private key becomes compromised, then any other keys on my system would probably also become compromised
- Just use a single key that is password protected (i.e. encrypted)
# Key algorithms
## ED25519 keys
- ED25519 keys appear to be the most secure type of SSH key, as opposed to DSA, RSA, or ECDSA
### Naming convention
- Public key: `id_ed25519.pub`
- Private key: `id_ed25519`
  - Yes, literally the string "id"
### Generate the key pair
- `$ ssh-keygen -t ed25519 -C "<comment>"`
  - The "-C" flag and \<comment> are used to optionally label the key
- Make sure to encrypt with a password!
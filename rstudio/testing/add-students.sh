
## Add 100 users for teaching sessions
for u in {0..100}
do 
  useradd user$u && echo "user$u:user$u" | chpasswd
  mkdir /home/user$u && chown user$u:user$u /home/user$u
  addgroup user$u staff
done


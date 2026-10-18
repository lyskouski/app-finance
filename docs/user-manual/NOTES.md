# 1. Add the MiKTeX signing key
curl -fsSL https://miktex.org/download/key | sudo tee /usr/share/keyrings/miktex-keyring.asc > /dev/null

# 2. Register the repository for Ubuntu 24.04 (noble)
```
echo "deb [signed-by=/usr/share/keyrings/miktex-keyring.asc] https://miktex.org/download/ubuntu noble universe" \
  | sudo tee /etc/apt/sources.list.d/miktex.list
```

# 3. Install
```
sudo apt-get update
sudo apt-get install miktex
```

# 4. Finish setup (pick one)
```
miktexsetup finish                         # just for your user (MiKTeX's recommended choice)
# sudo miktexsetup --shared=yes finish     # system-wide
```

# 5. Let it download missing LaTeX packages automatically
```
initexmf --set-config-value '[MPM]AutoInstall=1'
#   (for a shared install: sudo initexmf --admin --set-config-value '[MPM]AutoInstall=1')
```

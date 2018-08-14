mkdir tmp
cp ~/.ssh/id_rsa.pub ./tmp/id_rsa.pub
docker build -t space-ctf .
rm -rf ./tmp/

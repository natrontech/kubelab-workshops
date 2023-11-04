# Solution for jq Basics

1. `cd ~/jq-basics`
2. `jq '.hobbies += ["dancing"]' sample.json > tmp.json && mv tmp.json sample.json`
3. `jq '.address.zip = "67890"' sample.json > tmp.json && mv tmp.json sample.json`

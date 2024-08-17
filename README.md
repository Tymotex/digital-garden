# Personal Wiki

A personal wiki based on [jackzha0/quartz](https://github.com/jackyzha0/quartz)
for software engineering and an assortment of other random topics I encounter
and find useful and interesting to study.

## Usage

```sh
# First-time setup. 
npm i
npx quartz create     # For initialising a new wiki only.

# Locally serve the frontend at localhost:8080
npx quartz build --serve
```

Publishing new changes is a matter of pushing to this repo. A GitHub Action at
`.github/workflows/deploy.yml` will kick in to deploy the changes to GitHub
Pages.

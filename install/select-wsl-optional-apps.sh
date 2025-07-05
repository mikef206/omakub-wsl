# Install optional components   
components=$(gum choose "gcloud" "Gemini CLI" "uv" "pipx" "poetry" --no-limit --selected "gcloud" --height 9 --header "Select added components to install")

for component in $components; do
	case $component in
	gcloud)
		curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo gpg --dearmor -o /usr/share/keyrings/cloud.google.gpg
        echo "deb [signed-by=/usr/share/keyrings/cloud.google.gpg] https://packages.cloud.google.com/apt cloud-sdk main" | sudo tee -a /etc/apt/sources.list.d/google-cloud-sdk.list
        sudo apt-get update && sudo apt-get install google-cloud-cli
		;;
	Gemini)
		npm install -g @google/gemini-cli
		;;
	uv)
		wget -qO- https://astral.sh/uv/install.sh | sh
		;;
	pipx)
		python3 -m pip install --user pipx
        python3 -m pipx ensurepath
        sudo pipx ensurepath --global # optional to allow pipx actions with --global argument
		;;
	poetry)
		pipx install poetry 
		;;
	esac
done
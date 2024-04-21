app_path="build/macos/Build/Products/debug/accountbook_for_obsidian_rest_api.app"
if [ -e "$app_path" ]; then
    sudo cp -r "$app_path" /Applications/accountbook_for_obsidian_rest_api.app
    echo "done".
else
    echo "The file does not exist."
fi
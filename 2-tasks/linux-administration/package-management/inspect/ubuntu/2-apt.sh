# - See how many packages are installed with $ apt list -i | wc -l
view_installed_packages() {
    apt list -i
}

# - It's nice that apt will show information about any package, including those that didn't come from a repository
#   - dpkg doesn't do this
view_metadata_about_package() {
    #apt show zoom
    apt show splunk
}

#view_installed_packages
view_metadata_about_package

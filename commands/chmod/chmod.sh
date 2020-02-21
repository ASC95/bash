# Recall that:
# - 7: read, write, execute for owner
# - 5: read and execute for group
# - 5: read and execute for world
# Files typically have default permissions of 644
add_owner_executable_permission() {
    chmod 755 <file>
}
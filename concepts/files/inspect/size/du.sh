#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE[0]}")"

# - https://linuxize.com/post/du-command-in-linux/
# - https://stackoverflow.com/questions/5694741/why-is-the-output-of-du-often-so-different-from-du-b
# - https://stackoverflow.com/questions/43126760/what-is-a-sparse-file-and-why-do-we-need-it

# - By default, du displays the disk usage of the file or directory argument (or the cwd if no argument was given)
#   - Disk usage is the amount of filesystem space that can't be used for something else because the file is occupying it
#   - Disk usage includes the complete last block of the file, which is mostly likely only partially full of data
inspect_file_disk_usage() {
  # - By default, the size of the file is displayed in kibibytes (powers of 1024). This is confirmed by the fact that all three variations produce the
  #   same output
  du '/home/austin/programming/repositories/aifbdp-splunk-apps/apps/local-deployment/untopchan/bin/data/base_plus_attack1a_scada.csv.gz'        # 418848  /home/austin/programming/repositories/aifbdp-splunk-apps/apps/local-deployment/untopchan/bin/data/base_plus_attack1a_scada.csv.gz
  du -B1024 '/home/austin/programming/repositories/aifbdp-splunk-apps/apps/local-deployment/untopchan/bin/data/base_plus_attack1a_scada.csv.gz' # 418848  /home/austin/programming/repositories/aifbdp-splunk-apps/apps/local-deployment/untopchan/bin/data/base_plus_attack1a_scada.csv.gz
  du -BK '/home/austin/programming/repositories/aifbdp-splunk-apps/apps/local-deployment/untopchan/bin/data/base_plus_attack1a_scada.csv.gz'    # 418848K /home/austin/programming/repositories/aifbdp-splunk-apps/apps/local-deployment/untopchan/bin/data/base_plus_attack1a_scada.csv.gz
  
  # - To display the disk usage in bytes, use the -B flag and give it a block size of 1
  #   - This is saying that if Linux block sizes were 1 byte (they're not, they're 1024 bytes), then that's how many blocks would be occupied
  #     - TBF, 428,900,352/1024 = 418848
  du -B1 '/home/austin/programming/repositories/aifbdp-splunk-apps/apps/local-deployment/untopchan/bin/data/base_plus_attack1a_scada.csv.gz'    # 428900352 /home/austin/programming/repositories/aifbdp-splunk-apps/apps/local-deployment/untopchan/bin/data/base_plus_attack1a_scada.csv.gz
}

# - If the --apparent-size option is used, du displays the apparent size of the file or directory argument (or the cwd if no argument was given) 
#   - The apparent size of a file is how much data the file is logically, not physically, composed of
#     - E.g. a non-sparse file usually has a partially full last block, and the empty part of that block doesn't count towards the apparent size
#       - This is why the apparent size of a non-sparse file is almost always less than its reserved disk usage
#     - E.g. the filesystem does not physically store the 0 blocks of a sparse file, even though those 0 blocks are part of the file
#       - This is why the apparent size of a sparse file is almost always greater than its reserved disk usage
#         - A file can contain many blocks of all 0s. If the filesystem simply records metadata about those blocks of 0s instead of actually reserving
#           space for them, the file is a sparse file
#           - The filesystem creates sparse files to be space and time efficient
#   - The apparent size can also be thought of as the number of bytes that would be transferred over the network if the file was sent over the network
inspect_file_apparent_size() {
  # - The apparent size of the gzipped CSV is less than its disk usage. This indicates that this is NOT a sparse file, which makes sense because it
  #   was gzipped!
  #   - All Linux blocks are currently 1024 bytes
  #   - divmod(428894652, 1024) = (418842, 444). Therefore, in units of 1024 bytes, 418842 + 1 blocks composed the apparent size
  #     - If only 418843 blocks of size 1024 are required to store the data, why are 418848 blocks reserved? 
  #         - I don't know, but I would like to find out
  du --apparent-size '/home/austin/programming/repositories/aifbdp-splunk-apps/apps/local-deployment/untopchan/bin/data/base_plus_attack1a_scada.csv.gz'  # 418843  /home/austin/programming/repositories/aifbdp-splunk-apps/apps/local-deployment/untopchan/bin/data/base_plus_attack1a_scada.csv.gz
  
  # - The -b flag is a shortcut for the --apparent-size and -B1 options
  du -b '/home/austin/programming/repositories/aifbdp-splunk-apps/apps/local-deployment/untopchan/bin/data/base_plus_attack1a_scada.csv.gz'               # 428894652 /home/austin/programming/repositories/aifbdp-splunk-apps/apps/local-deployment/untopchan/bin/data/base_plus_attack1a_scada.csv.gz
}

# - Normally, du prints the size of every file and subdirectory within a directory (either disk usage or apparent size depending on the arguments)
# - If I just want a grant total for a directory, use the -s flag
inspect_directory_size(){
  # - View total disk usage in bytes
  du -s -B1 ~/programming # 15361507328 /home/austin/programming
  # - View total disk usage in gibibytes
  du -s -BG ~/programming # 15G /home/austin/programming

  # - View total apparent size in bytes
  du -s -b ~/programming # 15242789073 /home/austin/programming
  # - View total apparent size in gibibytes
  du -s --apparent-size -BG ~/programming # 15G /home/austin/programming
}

# - There is nothing inconsistent about the file sizes reported by different block sizes
compare_block_sizes() {
  du -s -B1 ~/programming # 15361507328 /home/austin/programming

  # - 15361507328 bytes / 1 kibibyte (i.e. 1024 bytes) = 15001472 kibibytes, or 15001472K
  du -s -BK ~/programming # 15001472K       /home/austin/programming

  # - 15361507328 bytes / 1 mebibyte (i.e. 1024 * 1024 bytes) = 14649.875 mebibytes, or 14650M
  du -s -BM ~/programming # 14650M /home/austin/programming
}

#inspect_file_disk_usage
#inspect_file_apparent_size
#inspect_directory_size
compare_block_sizes
import os

# See the single-command.sh notes


def deal_with_sudo():
    # There is no FOO variable in the output of either command
    #os.system('FOO=lentils sudo env')
    #print('')
    #os.system('sudo FOO=lentils sudo env')
    #print('')
    # This is the only way to get FOO inside of env that I've seen
    os.system('sudo FOO=lentils env')


def no_sudo():
    os.system('FOO=lentils sudo echo $FOO') # ""
    os.system('FOO=lentils; sudo echo $FOO') # lentils


if __name__ == '__main__':
    deal_with_sudo()

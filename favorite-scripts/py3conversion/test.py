def custom_cmp_by_year_validcount_name(e1, e2):
    '''
    - I'm not sorting "first" by anything, unlike the _index_multisort(). I'm comparing multiple "attributes" of each "list object" to determine if
      one is greater than the other
    '''
    # sort by year first
    if e1[1] == e2[1]: # years are equal
        if e1[4] == e2[4]: # valid counts are equal
            if e1[2] < e2[2]:
                return -1
            else:
                return 1
        elif e1[4] < e2[4]:
            return 1
        else:
            return -1
    elif e1[1] < e2[1]:
        return -1
    else:
        return 1

data = [
    ['hourly', '2000', 'Alaska', 8760, 5000, 3760],
    ['hourly', '2001', 'Alabama', 8760, 4001, 4760],
    ['hourly', '2001', 'Maine', 8760, 2999, 5760],
    ['hourly', '2000', 'Maine', 8760, 3000, 5760],
    ['hourly', '2001', 'Alaska', 8760, 5001, 3760],
    ['hourly', '2001', 'Virginia', 8760, 4001, 4760],
    ['hourly', '2000', 'Virginia', 8760, 4000, 4760],
    ['hourly', '2000', 'Alabama', 8760, 4000, 4760]
]

sorted_data = sorted(data, cmp=custom_cmp_by_year_validcount_name)
print(sorted_data)

d = {}
d.keys()
d.has_key()
d.iterkeys()
d.itervalues()
d.iteritems()
    fileinput.hello()
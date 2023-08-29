import os

remove = True
# remove = False

def listFilder(name):
    items = os.listdir(name)
    for i in items:
        path = os.path.join(name, i)
        if(os.path.isdir(path)):
            listFilder(path)
        elif (i.endswith(".exe")):
            print("" + path)
            if remove:
                os.remove(path)

listFilder(os.path.abspath("."))


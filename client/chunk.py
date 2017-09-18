import requests
import time
import sys

direct = sys.argv[1] == "direct"

if direct == True:
  url = "http://localhost/assets/ankit/interlaced/IPHONE5.ts"
else:
  url = "http://localhost/file/qazxswe"

chunk_size = 1024 * 1024
current_byte = 0

start = time.clock()

file_size = int(requests.head(url).headers['content-length'])
tmp_file = open("file.ts", "wb")
while current_byte <= file_size:
  #print 'Downloading %d - %d of %d' % (current_byte, current_byte + chunk_size, file_size)
  byte_range = "bytes=%d-%d" % (current_byte, current_byte + chunk_size)
  response = requests.get(url, headers={"Range": byte_range})
  for block in response.iter_content(chunk_size):
    tmp_file.write(block)

  current_byte = current_byte+chunk_size
tmp_file.close()

print time.clock() - start

#print "Done"

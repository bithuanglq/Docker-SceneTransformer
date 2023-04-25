from subprocess import call
import os.path
import glob
from tqdm import tqdm

tfrecord_path = './data/tf_records/validation'
idx_path = './data/idxs/validation'
batch_size = 1

tfrecords = glob.glob(tfrecord_path+'/*')

for tfrecord in tqdm(tfrecords):
    idxname = idx_path + '/' + tfrecord.split('/')[-1]
    call(["/usr/local/bin/python","-m","tfrecord.tools.tfrecord2idx", tfrecord, idxname])
    if os.path.exists(idxname) == False:
        call(["rm", f"{tfrecord}"])
        print("Delete the invalid file!")

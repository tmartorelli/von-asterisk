import sys
import random
import sqlite3
from datetime import datetime


now = datetime.now()
print('Number of arguments:', len(sys.argv), 'arguments')
print('Argument List:', sys.argv)

original_input = sys.argv[1:]

print(",".join(random.sample(sys.argv[1:], len(sys.argv)-1)))
		

def sub_elements(elements_list):
	result = elements_list[0]
	for e in elements_list[1:]:
		result -= e
	return result

print(sub_elements([int(sys.argv[2]), int(sys.argv[4]), int(sys.argv[6])]))

subtraction = sub_elements([int(sys.argv[2]), int(sys.argv[4]), int(sys.argv[6])])

print(sys.argv[2], sys.argv[4], sys.argv[6])

conn = sqlite3.connect('vonage.db')

cursor = conn.cursor()

cursor.execute("INSERT INTO outcomes(date_time, inputs, subtraction) VALUES({}, {}, {})".format(now, original_input, subtraction))




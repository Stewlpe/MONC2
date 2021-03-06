EPOCHS = 30
MINIBATCH = 10
CROP_SIZE = 200
LEN_TRAIN = 0.7


train : train.py
	#  --epochs=10 --minib=1 --crop=100 --lentrain=0.1
	python3 -W ignore train.py -E $(EPOCHS) -m $(MINIBATCH) -c $(CROP_SIZE) -t $(LEN_TRAIN)

main : main.py
	python3 -W ignore main.py -E $(EPOCHS) -m $(MINIBATCH) -c $(CROP_SIZE) -t $(LEN_TRAIN)

tb :
	tensorboard --logdir output/runs

plaf :
	srun -p sirocco python3.6 -W ignore main.py -E $(EPOCHS) -m $(MINIBATCH) -c $(CROP_SIZE) -t $(LEN_TRAIN)

# mod :
# 	module load slurm
# 	module load language/python/3.6

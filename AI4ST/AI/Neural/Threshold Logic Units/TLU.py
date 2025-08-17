import math

class TLU:
	def __init__(self):
		self.theta = 0
		self.Weights = []

	def train(self, Tests, eta, policy):
		self.theta = 0
		self.Weights = [0 for i in range (0, int(math.log2(len(Tests))))]

		if (policy == "online"):
			self.train_online(Tests, eta)
		elif (policy == "batch"):
			self.train_batch(Tests, eta)

	def train_online(self, Tests, eta):
		error = 1
		attempt = 0

		while (error != 0):
			error = 0

			for T in Tests:
				Inputs, output = T[0], T[1]
				y = self.evaluate(Inputs)

				if (y != output):
					error = error + abs(output - y)
					self.theta = self.theta - eta * (output - y)
					self.Weights = [w + eta * (output - y) * i for w, i in zip(self.Weights, Inputs)]

			attempt = attempt + 1
			print("Attempt:", attempt, " Weights: ", self.Weights, " theta: ", self.theta, " error: ", error)

	def train_batch(self, Tests, eta):
		error = 1
		attempt = 0

		while (error != 0):
			error = 0
			Weights_temp = [0 for i in range (0, int(math.log2(len(Tests))))]
			theta_temp = 0

			for T in Tests:
				Inputs, output = T[0], T[1]
				y = self.evaluate(Inputs)

				if (y != output):
					error = error + abs(output - y)
					theta_temp = theta_temp - eta * (output - y)
					Weights_temp = [w + eta * (output - y) * i for w, i in zip(Weights_temp, Inputs)]

			self.theta = self.theta + theta_temp
			self.Weights = [a + b for a, b in zip(self.Weights, Weights_temp)]
			attempt = attempt + 1
			print("Attempt:", attempt, " Weights: ", self.Weights, " theta: ", self.theta, " error: ", error)

	def evaluate(self, Data):
		return 1 if sum(d * w for d, w in zip(Data, self.Weights)) >= self.theta else 0

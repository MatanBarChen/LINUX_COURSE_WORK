import argparse
import matplotlib.pyplot as plt

parser = argparse.ArgumentParser(description='Plant data plots')
parser.add_argument('--plant', type=str, required=True)
parser.add_argument('--height', nargs='+', type=int, required=True)
parser.add_argument('--leaf_count', nargs='+', type=int, required=True)
parser.add_argument('--dry_weight', nargs='+', type=float, required=True)

args = parser.parse_args()

# גרפים
plt.plot(args.height)
plt.title(f"{args.plant} - Height")
plt.savefig("height.png")
plt.clf()

plt.plot(args.leaf_count)
plt.title(f"{args.plant} - Leaf Count")
plt.savefig("leaf_count.png")
plt.clf()

plt.plot(args.dry_weight)
plt.title(f"{args.plant} - Dry Weight")
plt.savefig("weight.png")
plt.clf()

print("Custom plots created successfully.")


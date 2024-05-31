# importing torch
import os
from platform import python_version
import matplotlib
import matplotlib.pyplot as plt
import torch
from torchrbf import RBFInterpolator

matplotlib.use("TKAgg")
import kaolin as kao

from fastapi import FastAPI


def display_cuda_info():
    # get index of currently selected device
    torch.cuda.current_device()
    # get number of GPUs available
    nb_GPU = torch.cuda.device_count()
    # get the name of the device
    device_name = torch.cuda.get_device_name(0)

    device = torch.device("cuda" if torch.cuda.is_available() else "cpu")
    myprint = (
        "Python "
        + str(python_version())
        + " initialization of Torch "
        + torch.__version__
        + " using: "
        + str(nb_GPU)
        + " available GPUs and "
        + str(device)
        + " device called "
        + device_name
    )
    os.system("echo " + myprint)


def run_demo_torchrbf():
    y = torch.rand(100, 2)  # Data coordinates
    d = torch.rand(100, 3)  # Data vectors at each point

    print("Computing RBF using torch ...")
    interpolator = RBFInterpolator(y, d, smoothing=1.0, kernel="thin_plate_spline")
    print("Computation done.")

    print("Begin display:")
    # Query coordinates (100x100 grid of points)
    x = torch.linspace(0, 1, 100)
    y = torch.linspace(0, 1, 100)
    grid_points = torch.meshgrid(x, y, indexing="ij")
    grid_points = torch.stack(grid_points, dim=-1).reshape(-1, 2)

    # Query RBF on grid points
    interp_vals = interpolator(grid_points)

    # Plot the interpolated values in 2D
    plt.scatter(grid_points[:, 0], grid_points[:, 1], c=interp_vals[:, 0])
    plt.title("Interpolated values in 2D")
    plt.show()


def test_kaolin():
    _ = torch.random.manual_seed(1)
    octree = kao.ops.random.random_spc_octrees(2, 3, device=0)
    print("octree: ", octree)
    return octree


app = FastAPI()


@app.get("/perform-computation")
async def perform_computation():
    # Perform PyTorch computation here
    display_cuda_info()
    run_demo_torchrbf()
    octree = test_kaolin()
    # need to convert to cpu first and then to numpy to extract a list to share
    np_octree = octree[0].cpu().numpy().tolist()
    print("octree list: ", np_octree)

    result = {"result": np_octree}  # Placeholder result
    return result


if __name__ == "__main__":
    import uvicorn

    uvicorn.run(app, host="0.0.0.0", port=5000)

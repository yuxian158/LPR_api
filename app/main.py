from fastapi import FastAPI
from pydantic import BaseModel
import base64
from hyperlpr import *
import cv2

class Item(BaseModel):
    image: str


app = FastAPI()


@app.get("/")
async def m():
    return "hello word"


@app.post("/items/")
async def create_item(item: Item):
    imgdata = base64.b64decode(item.image)
    with open("test.jpg", "wb") as png:
        png.write(imgdata)
    image = cv2.imread("test.jpg")
    return HyperLPR_plate_recognition(image)

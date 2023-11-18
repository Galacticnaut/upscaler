from PIL import Image
import sys
import os

def convert_to_icon(image_path):
    img = Image.open(image_path)
    filename_without_extension = os.path.splitext(os.path.basename(image_path))[0]
    icon_path = filename_without_extension + '.ico'
    img.save(icon_path, format='ICO', sizes=[(32,32)])

if __name__ == "__main__":
    image_path = sys.argv[1]
    convert_to_icon(image_path)
image_speed = 0;

if (!place_free(x-1, y))
    image_index = 0;
else if (!place_free(x+1, y))
    image_index = 1;
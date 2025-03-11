# MiniRT

Mini ray tracer, a humble yet functional and ready-to-go ray tracing engine.

## Algorithm

Understanding ray tracing isn't too complicated, but it's not as simple as it sounds either.

### What is Ray Tracing?

To explain ray tracing, let's first understand how the human eye perceives images. When you look at an object, light rays travel from a light source, bounce off the object, and reach your eyes, allowing you to see the object in color and detail. Each ray interacts differently with surfaces, contributing to shadows, reflections, and shading.

Ray tracing simulates this process computationally by shooting rays and tracking their interactions with objects. However, instead of casting rays from the light source, we optimize the process by casting them from the camera (eye) towards the scene.

For shading, we cast additional rays from the intersection point toward light sources. If an object obstructs this ray, the point is in shadow; otherwise, it is illuminated.

## Colors and Lighting

An image is composed of pixels, each with a color. To determine the color of a pixel, a ray is traced through it to find what it intersects with in the scene.

- If a ray intersects an object, the pixel takes the object's color.
- The object's lighting determines whether it appears shaded or illuminated.

More details on shading will follow in later sections.

## Library Requirements

A well-structured **vector** library is crucial for implementing this algorithm efficiently. A **matrix** library can also be beneficial for transformations.

## Camera Setup

Rendering an image requires a camera, which is defined by:

1. **Origin** – The camera's position.
2. **Forward direction** – Where the camera is looking.
3. **Field of View (FOV)** – The extent of the observable scene.

### Rays

A ray is mathematically represented as:

```
origin + t * direction
```

where:
- **origin** is the starting point.
- **direction** is the ray's direction.
- **t** determines the point along the ray.

To generate rays, we define an **image plane** one unit away from the camera and compute ray directions based on its coordinates.

### Image Plane Calculation

To map pixels to ray directions, we:
1. Compute the aspect ratio: `ar = WIDTH / HEIGHT`
2. Calculate the plane height: `h = tan(FOV / 2)`
3. Compute the plane width: `w = h * ar`

Each pixel is then mapped to coordinates between -1 and 1 in this plane.

### Up and Right Vectors

To determine the camera's **up** and **right** vectors:
- Compute **up** using the cross product of a reference axis and the camera's forward direction.
- Compute **right** using the cross product of **up** and **forward**.

### Computing Ray Directions

Ray directions are computed using:

```
(up * h * y) + (right * w * x) + forward
```

where `(x, y)` are the normalized pixel coordinates.

## Object Intersections

Each object has a mathematical representation, such as:
- Spheres: `(x - cx)^2 + (y - cy)^2 + (z - cz)^2 = r^2`

To find intersections, we substitute the ray equation into these formulas and solve for **t**.

### Shading and Lighting

Once a ray intersects an object, the pixel is colored based on the object's material and lighting.

#### Ambient Light

Ambient light represents indirect illumination. It is applied universally by:

```
ambient_color = object_color * ambient_ratio
```

#### Shadows

To determine if a point is in shadow:
- Cast a ray from the point toward each light source.
- If an object blocks the ray, the point is shadowed.

This basic lighting model is extendable to include reflections, refractions, and more.

---

This guide provides a foundational understanding of ray tracing in MiniRT. The next steps involve implementing optimizations and additional features to enhance realism and efficiency.


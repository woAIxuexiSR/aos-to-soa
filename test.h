struct Interval {
    float low, high;
};

struct Point2f { float x, y; };
struct Point2i { int x, y; };
struct Point3f { float x, y, z; };
struct Vector3f { float x, y, z; };
struct Normal3f { float x[3]; };
struct Point3fi { Interval x, y, z; };

#include "test_soa.h"
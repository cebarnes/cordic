import math

def create_tan_table(x):
    tan = {}
    for i in range(x):
        tan[2**(-i)] = math.degrees(math.atan(2**(-i)))
    return tan

def cordic_iteration(angle,n):
    x,y = 1.0/find_An(n),0.0
    z = float(angle)
    str_angle = str(angle)
    tan_table = create_tan_table(2*n)

    for i in range(n+1):
        if z <= 0:
            di = -1.0
        else:
            di = 1.0
        newx = x - (y * di * 2.0**(-i)) 
        newy = y + (x * di * 2.0**(-i))
        x = newx
        y = newy
        z = z - (di * tan_table[2.0**(-i)])
    print "cos(angle) = "  + str(x) 
    print "sin(angle) = "  + str(y)  
    f = math.degrees(x)
    g = math.degrees(y)

    return f,g

def find_angle(t):

    x = t[0]
    y = t[1]
    return math.degrees(math.atan(y/x))


def find_An(n):
    An = math.sqrt(2)
    for i in range(1,n):
        An = An * math.sqrt(1 + 2**(-2*i))
    return An

def main():
    t = cordic_iteration(20,40)
    print "\nangle rotated = ", find_angle(t)

if __name__ == '__main__':
    main()
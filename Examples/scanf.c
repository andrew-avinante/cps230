#include "stdarg.h"
#include "string.h"

int readAsGrok()
{
    int sum = 0;
    char c = getchar();
    while('0' <= c && c<= '9' || 'A' <= c && c <= 'I')
    {
        c = getchar();
    }
    return sum;
}

int readAsDecimal()
{

}

int scanf(char * fmtString, ...)
{
    va_list args;
    va_start(args, fmtString);
    int len = strlen(fmtString);
    for(int i = 0; i < len; ++i)
    {
        if(fmtString[i] == '%')
        {
            ++i;
            if(i < len && fmtString[i] == 'g')
            {

            }
            else if(i < len && fmtString[i] == 'g')
            {
                
            }
        }
    }
    va_end(args);
    // return sum;
}

int main()
{
    int num;
    scanf("%g", &num);
    printf("%d\n", num);
}
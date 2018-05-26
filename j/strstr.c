#include <stdio.h>
#include <stddef.h>
#include <string.h>

static ptrdiff_t
j_strstr (const char *haystack, size_t haystack_length, const char *needle, size_t needle_length)
{
       if (!haystack_length || !needle_length || needle_length > haystack_length)
               return -1;
       char const needle0 = needle [0];
       for (ptrdiff_t i = 0; i <= (ptrdiff_t)(haystack_length - needle_length); ++i) {
               if (haystack [i] == needle0 && memcmp (haystack + i, needle, needle_length) == 0)
                       return i;
       }
       return -1;
}

int main ()
{
	printf ("%d\n", (int)j_strstr ("foo", 3, "o", 1));
	printf ("%d\n", (int)j_strstr ("foo", 3, "f", 1));
	printf ("%d\n", (int)j_strstr ("foo", 3, "z", 1));
	printf ("%d\n", (int)j_strstr ("foo", 3, "foo",3 ));
	printf ("%d\n", (int)j_strstr ("foo", 3, "oo", 2));
	printf ("%d\n", (int)j_strstr ("foo", 3, "fo", 2));
	printf ("%d\n", (int)j_strstr ("foo", 3, "of", 2));
}

#include <nspr.h>
#include <stdio.h>

int main(void)
{
	printf("integer(c_int) :: pr_failure = %d\n", PR_FAILURE);
	printf("integer(c_int) :: pr_success = %d\n", PR_SUCCESS);

	return 0;
}

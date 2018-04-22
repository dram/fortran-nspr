#include <nspr.h>
#include <stdio.h>

#define INT_PARAMETER "integer(c_int), parameter :: "

int main(void)
{
	printf(INT_PARAMETER "pr_failure = %d\n", PR_FAILURE);
	printf(INT_PARAMETER "pr_success = %d\n", PR_SUCCESS);

	return 0;
}

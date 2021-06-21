#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <sys/types.h>

int infinite_while(void);

/**
 * main - entry point, creates zombie processes
 *
 * Return: 0
 */
int main()
{
	int i;
	pid_t child_id;

	for (i = 0; i < 5; i++)
	{
		child_id = fork();
		printf("Zombie process created, PID: %ld", (long int) child_id);
		exit(1);
	}
	infinite_while();
	return (0);
}

/**
 * infinite_while - stalls program
 *
 * Return: 0
 */
int infinite_while(void)
{
	while (1)
	{
		sleep(1);
	}
	return (0);
}

/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   init_env.c                                         :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: khansman <marvin@42.fr>                    +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2016/08/22 13:53:22 by khansman          #+#    #+#             */
/*   Updated: 2016/08/24 18:10:00 by arnovan-         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "corewar.h"

/*
**	The functions in this file are for initialising the enviroment variables.
*/


/*
void init_player_struct(t_env *env, int player_num)
{
	env->players[player_num].player_ref
	env->players[player_num]
	env->players[player_num]
	env->players[player_num]
	env->players[player_num]
	env->players[player_num]
	env->players[player_num]
}
*/
int		ft_set_player_number(t_env *env, char *s1, char *s2)
{
	int		num;
	int		k;

	num = (s1) ? ft_atoi(s1) : 0;
	k = -1;
	if (!s2 || (s1 && !ft_are_all_digits(s1)) || (num > MAX_PLAYERS))
		error_quit(4);
	else if (s1)
	{
		while (++k < env->num_players)
			if (env->players[k].number == num)
				error_quit(5);
		env->players[env->num_players].number = num;
	}
	else if (!s1)
	{
		while (++k < env->num_players)
			if (env->players[k].number == env->num_players)
				error_quit(5);
		env->players[env->num_players].number = env->num_players;
	}
	env->players[env->num_players].file_name = ft_strdup(s2);
	env->num_players++;
	return (s1 == NULL);
}

int		ft_set_dump_cycle(t_env *env, char *str)
{
	static int	set;

	if (set)
		error_quit(2);
	else if (!str || !ft_are_all_digits(str))
		error_quit(3);
	else
		env->dump_cycle = ft_atoi(str);
	return (1);
}

void	init_env(t_env *env)
{
	if (!(env->memory = malloc(MEM_SIZE)))
		error_quit(0);
	ft_bzero(env->memory, (MEM_SIZE));
	env->cycle = CYCLE_TO_DIE;
//	init_player_struct(env, 0);
}

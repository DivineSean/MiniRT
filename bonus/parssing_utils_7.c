/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   parssing_utils_7.c                                 :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: markik <markik@student.42.fr>              +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2023/11/04 14:53:09 by markik            #+#    #+#             */
/*   Updated: 2023/11/06 18:29:07 by markik           ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "Minirt.h"

int	sphere_protection(char *line)
{
	char	**splite;
	size_t	i;

	i = 0;
	splite = ft_split(line, ' ');
	if (splite_size(splite) == 5)
	{
		if (!check_bumb(splite[4]))
			return (free_double(splite), 1);
	}
	else if (splite_size(splite) != 4)
		return (free_double(splite), 1);
	if (ft_strncmp(splite[0], "sp", 3))
		return (free_double(splite), 1);
	if (xyz_correct(splite[1]))
		return (free_double(splite), 1);
	if (sphere_diam_correct(splite[2]))
		return (free_double(splite), 1);
	if (check_rgb(splite[3]))
		return (free_double(splite), 1);
	return (free_double(splite), 0);
}

int	plane_protection(char *line)
{
	char	**splite;
	size_t	i;

	i = 0;
	splite = ft_split(line, ' ');
	if (splite_size(splite) != 4)
		return (free_double(splite), 1);
	if (ft_strncmp(splite[0], "pl", 3))
		return (free_double(splite), 1);
	if (xyz_correct(splite[1]))
		return (free_double(splite), 1);
	if (xyz_vectors_correct(splite[2]))
		return (free_double(splite), 1);
	if (check_rgb(splite[3]))
		return (free_double(splite), 1);
	return (free_double(splite), 0);
}

int	cylinder_protection(char *line)
{
	char	**splite;
	size_t	i;

	i = 0;
	splite = ft_split(line, ' ');
	if (splite_size(splite) != 6)
		return (free_double(splite), 1);
	if (ft_strncmp(splite[0], "cy", 3))
		return (free_double(splite), 1);
	if (xyz_correct(splite[1]))
		return (free_double(splite), 1);
	if (xyz_vectors_correct(splite[2]))
		return (free_double(splite), 1);
	if (sphere_diam_correct(splite[3]))
		return (free_double(splite), 1);
	if (sphere_diam_correct(splite[4]))
		return (free_double(splite), 1);
	if (check_rgb(splite[5]))
		return (free_double(splite), 1);
	return (free_double(splite), 0);
}

int	protection_tool(char *lines, int *flag_a, int *flag_c, int *flag_cn)
{
	if (lines[0] == 'A' && *flag_a == 0)
	{
		if (ambient_lightning_protection(lines))
			return (1);
		*flag_a = 1;
	}
	else if (lines[0] == 'C' && *flag_c == 0)
	{
		if (camera_protection(lines))
			return (2);
		*flag_c = 1;
	}
	else if (lines[0] == 'L')
	{
		if (light_protection(lines))
			return (3);
	}
	else
		return (protection_tool_two(lines, flag_cn));
	return (0);
}

int	protection_tool_two(char *lines, int *flag_cn)
{
	if (lines[0] == 'c' && lines[1] == 'n' && *flag_cn == 0)
	{
		if (cn_protection(lines))
			return (9);
		*flag_cn = 1;
	}
	else if (lines[0] == 's' && lines[1] == 'p')
	{
		if (sphere_protection(lines))
			return (4);
	}
	else if (lines[0] == 'p' && lines[1] == 'l')
	{
		if (plane_protection(lines))
			return (5);
	}
	else if (lines[0] == 'c' && lines[1] == 'y')
	{
		if (cylinder_protection(lines))
			return (6);
	}
	else
		return (7);
	return (0);
}

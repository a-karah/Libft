/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_strtrim.c                                       :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: akarahan <akarahan@student.42istanbul.com. +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2022/01/03 12:22:38 by akarahan          #+#    #+#             */
/*   Updated: 2022/01/03 15:49:16 by akarahan         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "libft.h"

char	*ft_strtrim(char const *s1, char const *set)
{
	char	*trimmed;
	size_t	end;

	if (!s1)
		return (NULL);
	if (!set)
		return (ft_strdup(s1));
	while (*s1 && ft_strchr(set, *s1))
		++s1;
	end = ft_strlen(s1);
	while (end > 0 && ft_strchr(set, s1[end - 1]))
		--end;
	trimmed = (char *)malloc(end + 1);
	if (!trimmed)
		return (NULL);
	ft_strlcpy(trimmed, s1, end + 1);
	return (trimmed);
}

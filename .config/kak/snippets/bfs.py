def bfs(adj_list, start_node):
    queue = []
    visited = set()
    parent = {v: None for v in adj_list}

    queue.append(start_node)
    visited.add(start_node)

    while queue:
        curr = queue.pop(0)

        for neighbor in adj_list[curr]:
            if neighbor not in visited:
                visited.add(neighbor)
                parent[neighbor] = curr
                queue.append(neighbor)

    return parent

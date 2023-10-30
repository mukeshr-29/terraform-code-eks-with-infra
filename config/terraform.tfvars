region = "us-east-1"
access_key = "***********"
secret_key = "*********************"

vpc_config = {
    vpc01 = {
    vpc_cidr_block = "192.168.0.0/16"
    tags = {
        }
    }

}
subnet_config = {
   "public-us-east-1a" = {
        vpc_name = "vpc01"
    cidr_block = "192.168.0.0/18"
    availability_zone = "us-east-1a"
    tags = {
        "Name" = "public-us-east-1a"
    }
    }
   "public-us-east-1b" = {
        vpc_name = "vpc01"
    cidr_block = "192.168.64.0/18"
    availability_zone = "us-east-1b"
    tags = {
        "Name" = "public-us-east-1b"
    }
    }
   "private-us-east-1a" = {
        vpc_name = "vpc01"
    cidr_block = "192.168.128.0/18"
    availability_zone = "us-east-1a"
    tags = {
        "Name" = "private-us-east-1a"
    }
    }
   "private-us-east-1b" = {
        vpc_name = "vpc01"
    cidr_block = "192.168.192.0/18"
    availability_zone = "us-east-1b"
    tags = {
        "Name" = "private-us-east-1b"
    }
    }
}
internet_GW_config = { 
    igw01 = {
        vpc_name = "vpc01"
        tags = {
            "Name" = "my_IGW"
        }
    }

}

elastic_IP_config = {
    eip01 ={
        tags = {
            "Name" = "nat01"
        }
    }
    eip02 ={
        tags = {
            "Name" = "nat02"
        }
    }
}
nat_GW_config = {
    natGW01 = {
        eip_name = "eip01"
        subnet_name = "public-us-east-1a"
        tags = {
            "Name" = "natGW01"
        }
    }
     natGW02 = {
        eip_name = "eip02"
        subnet_name = "public-us-east-1b"
        tags = {
            "Name" = "natGW02"
        }
    }
    
}

    
aws_route_table_config = {
    rt01 = {
        private = 0

        vpc_name = "vpc01"
        gateway_name = "igw01"
        tags = {
            "Name" = "Public_Route"
        }
    }
    rt02 = {
        private = 1
        vpc_name = "vpc01"
        gateway_name = "natGW01"
        tags = {
            "Name" = "Private_Route"
        }

    }
    rt03 = {
        private = 1
        vpc_name = "vpc01"
        gateway_name = "natGW02"
        tags = {
            "Name" = "Private_Route"
        }

    }

}
aws_route_table_association_config = {
    rt01assoc = {
        subnet_name = "public-us-east-1a"
        aws_route_table_name = "rt01"
    }
    rt02assoc = {
        subnet_name = "public-us-east-1b"
        aws_route_table_name = "rt01"
    }
    rt03assoc = {
        subnet_name = "private-us-east-1a"
        aws_route_table_name = "rt02"
    }
    rt04assoc = {
        subnet_name = "private-us-east-1b"
        aws_route_table_name = "rt03"
    }
}

aws_eks_cluster_config = {
    "project-cluster" ={
        eks_cluster_name = "project-cluster"
        subnet1 = "public-us-east-1a"
        subnet2 = "public-us-east-1b"
        subnet3 = "private-us-east-1a"
        subnet4 = "private-us-east-1b"

    
    tags = {
        "Name" = "project-cluster"
    }
    }
}

aws_eks_node_group_config = {
    "node1" = {
        node_group_name = "node1"
        eks_cluster_name = "project-cluster"
        node_iam_role = "eks-node-general1"
        subnet1 = "private-us-east-1a"
        subnet2 = "private-us-east-1b"
        tags = {
            "Name" = "node1"
        }
    }
    "node2" = {
        node_group_name = "node2"
        eks_cluster_name = "project-cluster"
        node_iam_role = "eks-node-general2"
        subnet1 = "private-us-east-1a"
        subnet2 = "private-us-east-1b"
        tags = {
            "Name" = "node2"
        }
    }
}
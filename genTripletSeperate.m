function tripletIndex = genTripletSeperate(p_id, g_id)
% generate triplet index according to the input id. In this version, we
% didn't fuse the probe and gallery set, and use them seperatly.
% input:
% id_batch: [1, n], each element indicate the id of the corresponding image
% in im_batch and feature_map
% output:
% tripletIndex: [N,3], N is the total number of triplets
% triplet:(x, x_pos, x_neg)
tripletIndex = [];
for i=1:numel(p_id)
    index_prb = i;
    index_pos = find(g_id == p_id(index_prb));
    index_neg = setdiff(1:numel(g_id), index_pos);
    
    [X, Y, Z] = meshgrid(index_prb, index_pos, index_neg);
    tripletIndex = cat(1, tripletIndex, [X(:), Y(:), Z(:)]);
end